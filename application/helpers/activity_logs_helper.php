<?php

/**
 * dynamically generate the activity logs for projects
 *
 * @param string $log_type
 * @param string $field
 * @param string $value
 * @return html
 */
if (!function_exists('get_change_logs')) {

    function get_change_logs($log_type, $field, $value) {
        $log_type = $log_type;
        $from_value = $value['from'];
        $to_value = $value['to'];
        $changes = "";

        $ci = get_instance();
        $model_schema = array();
        if ($log_type === "task") {
            $model_schema = $ci->Tasks_model->schema();
        } else if ($log_type === "milestone") {
            $model_schema = $ci->Milestones_model->schema();
        } else if ($log_type === "project_comment") {
            $model_schema = $ci->Project_comments_model->schema();
        } else if ($log_type === "project_file") {
            $model_schema = $ci->Project_files_model->schema();
        } else if ($log_type === "file_comment") {
            $model_schema = $ci->Project_comments_model->schema();
        } else if ($log_type === "task_comment") {
            $model_schema = $ci->Project_comments_model->schema();
        }
        $schema_info = get_array_value($model_schema, $field);
        if ($schema_info) {
            //prepare change value
            if (get_array_value($schema_info, "type") === "int") {
                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            } else if (get_array_value($schema_info, "type") === "text") {
                $from_value = mb_convert_encoding($from_value, 'HTML-ENTITIES', 'UTF-8');
                $to_value = mb_convert_encoding($to_value, 'HTML-ENTITIES', 'UTF-8');
                $opcodes = $ci->finediff->getDiffOpcodes($from_value, $to_value, FineDiff::$wordGranularity);
                $changes = nl2br($ci->finediff->renderDiffToHTMLFromOpcodes($from_value, $opcodes));
                $changes = mb_convert_encoding($changes, 'ASCII', 'HTML-ENTITIES');
            } else if (get_array_value($schema_info, "type") === "foreign_key") {
                $linked_model = get_array_value($schema_info, "linked_model");
                if ($from_value && $linked_model) {

                    if (get_array_value($schema_info, "link_type") === "user_group_list") {
                        $info = $linked_model->user_group_names($from_value);
                    } else {
                        $info = $linked_model->get_one($from_value);
                    }

                    $label_fields = get_array_value($schema_info, "label_fields");
                    $from_value = "";
                    foreach ($label_fields as $field) {
                        if (isset($info->$field)) {
                            $from_value.= $info->$field . " ";
                        }
                    }
                }

                if ($to_value && $linked_model) {

                    if (get_array_value($schema_info, "link_type") === "user_group_list") {
                        $info = $linked_model->user_group_names($to_value);
                    } else {
                        $info = $linked_model->get_one($to_value);
                    }

                    $label_fields = get_array_value($schema_info, "label_fields");
                    $to_value = "";
                    foreach ($label_fields as $field) {
                        if (isset($info->$field)) {
                            $to_value.= $info->$field . " ";
                        }
                    }
                }

                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            } else if (get_array_value($schema_info, "type") === "language_key") {
                $changes = "<del>" . lang($from_value) . "</del> <ins>" . lang($to_value) . "</ins>";
            } else if (get_array_value($schema_info, "type") === "date") {
                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            } else if (get_array_value($schema_info, "type") === "time") {
                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            } else if (get_array_value($schema_info, "type") === "date_time") {
                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            } else {
                $changes = "<del>" . $from_value . "</del> <ins>" . $to_value . "</ins>";
            }

            return get_array_value($schema_info, "label") . ": " . $changes;
        }
    }

}
