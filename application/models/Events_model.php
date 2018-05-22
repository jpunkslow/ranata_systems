<?php

class Events_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'events';
        parent::__construct($this->table);
    }

    function get_details($options = array()) {
        $events_table = $this->db->dbprefix('events');
        $users_table = $this->db->dbprefix('users');
        $clients_table = $this->db->dbprefix('clients');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $events_table.id=$id";
        }

        $start_date = get_array_value($options, "start_date");
        if ($start_date) {
            $where .= " AND DATE($events_table.start_date)>='$start_date'";
        }

        $end_date = get_array_value($options, "end_date");
        if ($end_date) {
            $where .= " AND DATE($events_table.end_date)<='$end_date'";
        }

        $user_id = get_array_value($options, "user_id");
        if ($user_id) {

            //find events where share with the user and his/her team
            $team_ids = get_array_value($options, "team_ids");
            $team_search_sql = "";

            //searh for teams
            if ($team_ids) {
                $teams_array = explode(",", $team_ids);
                foreach ($teams_array as $team_id) {
                    $team_search_sql.=" OR (FIND_IN_SET('team:$team_id', $events_table.share_with)) ";
                }
            }

            //searh for user and teams
            $where .= " AND ($events_table.created_by=$user_id 
                OR $events_table.share_with='all' 
                    OR (FIND_IN_SET('member:$user_id', $events_table.share_with))
                        $team_search_sql
                        )";
        }


        $client_id = get_array_value($options, "client_id");
        if ($client_id) {
            $where .= " AND $events_table.client_id=$client_id";
        }

        $limit = get_array_value($options, "limit");
        $limit = $limit ? $limit : "20000";
        $offset = get_array_value($options, "offset");
        $offset = $offset ? $offset : "0";

        $sql = "SELECT $events_table.*,
            CONCAT($users_table.first_name, ' ',$users_table.last_name) AS created_by_name, $users_table.image AS created_by_avatar, $clients_table.company_name
        FROM $events_table
        LEFT JOIN $users_table ON $users_table.id = $events_table.created_by
        LEFT JOIN $clients_table ON $clients_table.id = $events_table.client_id    
        WHERE $events_table.deleted=0 $where
        ORDER BY $events_table.start_date ASC
        LIMIT $offset, $limit";
        return $this->db->query($sql);
    }

    function count_events_today($user_id = 0) {
        $events_table = $this->db->dbprefix('events');
        $now = get_my_local_time("Y-m-d");
        $sql = "SELECT COUNT($events_table.id) AS total
        FROM $events_table
        WHERE $events_table.deleted=0 AND $events_table.created_by = $user_id AND ($events_table.start_date='$now' OR $events_table.end_date='$now')";
        return $this->db->query($sql)->row()->total;
    }

    function get_label_suggestions() {
        $events_table = $this->db->dbprefix('events');
        $sql = "SELECT GROUP_CONCAT(labels) AS label_groups
        FROM $events_table
        WHERE $events_table.deleted=0";
        return $this->db->query($sql)->row()->label_groups;
    }

}
