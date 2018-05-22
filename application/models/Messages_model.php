<?php

class Messages_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'messages';
        parent::__construct($this->table);
    }

    /*
     * prepare details info of a message
     */

    function get_details($options = array()) {
        $messages_table = $this->db->dbprefix('messages');
        $users_table = $this->db->dbprefix('users');

        $mode = get_array_value($options, "mode");

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $messages_table.id=$id";
        }

        $message_id = get_array_value($options, "message_id");
        if ($message_id) {
            $where .= " AND $messages_table.message_id=$message_id";
        }

        $user_id = get_array_value($options, "user_id");
        $join_with = "$messages_table.from_user_id";
        if ($user_id && $mode === "inbox") {
            $where .= " AND $messages_table.message_id=0  AND ($messages_table.from_user_id=$user_id OR $messages_table.to_user_id=$user_id) ";
        } else if ($user_id && $mode === "sent_items") {
            $where .= " AND $messages_table.message_id=0  AND ($messages_table.from_user_id=$user_id OR $messages_table.to_user_id=$user_id)";
            $join_with = "$messages_table.to_user_id";
        }

        $sql = "SELECT 0 AS reply_message_id, $messages_table.*, CONCAT($users_table.first_name, ' ', $users_table.last_name) AS user_name, $users_table.image AS user_image, $users_table.user_type
        FROM $messages_table
        LEFT JOIN $users_table ON $users_table.id=$join_with
        WHERE $messages_table.deleted=0 $where
        ORDER BY $messages_table.id ASC";

        return $this->db->query($sql);
    }

    /*
     * prepare inbox/sent items list
     */

    function get_list($options = array()) {
        $messages_table = $this->db->dbprefix('messages');
        $users_table = $this->db->dbprefix('users');

        $mode = get_array_value($options, "mode");
        $user_id = get_array_value($options, "user_id");

        if ($user_id && $mode === "inbox") {
            $where_user = "to_user_id";
            $select_user = "from_user_id";
        } else if ($user_id && $mode === "sent_items") {
            $where_user = "from_user_id";
            $select_user = "to_user_id";
        }

        //ignor sql mode here 
        try {
            $this->db->query("SET sql_mode = ''");
        } catch (Exception $e) {
            
        }

        $sql = "SELECT y.*, $messages_table.status, $messages_table.created_at, $messages_table.files,
                CONCAT($users_table.first_name, ' ', $users_table.last_name) AS user_name, $users_table.image AS user_image
                FROM (
                    SELECT max(x.id) as id, main_message_id,  subject, IF(subject='', (SELECT subject FROM $messages_table WHERE id=main_message_id) ,'') as reply_subject, $select_user
                        FROM (SELECT id, IF(message_id=0,id,message_id) as main_message_id, subject, $select_user 
                                FROM $messages_table
                              WHERE deleted=0 AND $where_user=$user_id  AND FIND_IN_SET($user_id, $messages_table.deleted_by_users) = 0) x
                    GROUP BY main_message_id) y
                LEFT JOIN $users_table ON $users_table.id= y.$select_user
                LEFT JOIN $messages_table ON $messages_table.id= y.id";
        return $this->db->query($sql);
    }

    /* prepare notifications of new message */

    function get_notifications($user_id, $last_message_checke_at = "0") {
        $messages_table = $this->db->dbprefix('messages');
        $users_table = $this->db->dbprefix('users');

        $sql = "SELECT $messages_table.id, $messages_table.message_id, $messages_table.created_at, CONCAT($users_table.first_name, ' ', $users_table.last_name) AS user_name, $users_table.image AS user_image
        FROM $messages_table
        LEFT JOIN $users_table ON $users_table.id=$messages_table.from_user_id
        WHERE $messages_table.deleted=0 AND $messages_table.status='unread'  AND $messages_table.to_user_id = $user_id
        AND timestamp($messages_table.created_at)>timestamp('$last_message_checke_at')
        ORDER BY timestamp($messages_table.created_at) DESC";
        return $this->db->query($sql);
    }

    /* update message ustats */

    function set_message_status_as_read($message_id, $user_id = 0) {
        $messages_table = $this->db->dbprefix('messages');
        $sql = "UPDATE $messages_table SET status='read' WHERE $messages_table.to_user_id=$user_id AND ($messages_table.message_id=$message_id OR $messages_table.id=$message_id)";
        return $this->db->query($sql);
    }

    function count_unread_message($user_id = 0) {
        $messages_table = $this->db->dbprefix('messages');

        $sql = "SELECT COUNT($messages_table.id) as total
        FROM $messages_table
        WHERE $messages_table.deleted=0 AND $messages_table.status='unread'  AND $messages_table.to_user_id = $user_id";
        return $this->db->query($sql)->row()->total;
    }

    function delete_messages_for_user($message_id = 0, $user_id = 0) {
        $messages_table = $this->db->dbprefix('messages');

        $sql = "UPDATE $messages_table SET $messages_table.deleted_by_users = CONCAT($messages_table.deleted_by_users,',',$user_id)
        WHERE $messages_table.id=$message_id OR $messages_table.message_id=$message_id";
        return $this->db->query($sql);
    }

    function clear_deleted_status($message_id = 0) {
        $messages_table = $this->db->dbprefix('messages');

        $sql = "UPDATE $messages_table SET $messages_table.deleted_by_users = ''
        WHERE $messages_table.id=$message_id OR $messages_table.message_id=$message_id";
        return $this->db->query($sql);
    }

}
