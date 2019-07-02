//
//  ViewController.swift
//  Internationalization
//
//  Created by App005 SYNERGY on 2019/5/29.
//  Copyright © 2019 App005 SYNERGY. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var selectSegment: NSSegmentedControl!
    @IBOutlet weak var sortFileTextField: NSTextField!
    @IBOutlet weak var completeTextField: NSTextField!
    @IBOutlet weak var baseTextField: NSTextField!
    @IBOutlet weak var textSctollView: NSScrollView!
    
    
    let nameList = ["app_name", "main_tab_today", "main_tab_activity", "main_tab_reminders", "settings", "loading", "distance_unit", "time_unit", "calories_unit", "Step", "steps_unit", "Step", "steps_unit", "entry_weight_goal", "main_today_goal", "entry_weight_goal", "main_today_goal", "data_details_week", "data_details_month", "data_details_average", "sleep_details_avg", "data_details_prompt_week", "data_details_prompt_month", "activity_select_mode", "history_all", "activity_all", "activity_sport_details_all", "history_all", "activity_all", "activity_sport_details_all", "history_all", "activity_all", "activity_sport_details_all", "activity_walking", "activity_running", "activity_trail_run", "activity_run_indoor", "activity_hiking", "activity_biking", "sport_map", "sport_details", "sport_report", "sport_pace", "sport_pace_suffix", "Average_pace", "sport_pace_suffix", "Average_pace", "sport_hr_suffix", "sport_cadence_suffix", "sport_time_suffix", "sport_report_maximum", "sleep_report_maximum", "sport_report_maximum", "sleep_report_maximum", "sport_report_altitude", "sport_report_cadence", "sport_report_best", "reminders_add", "reminders_hint1", "reminders_hint2", "reminders_hint3", "reminders_hint4", "reminders_type", "reminders_repeat", "reminders_time", "reminders_mark", "reminders_sport", "reminders_sleep", "goal_sleep", "reminders_sleep", "goal_sleep", "reminders_eat", "reminders_medicine", "sleep_details_wake_up_time", "sleep_details_weak", "reminders_wake", "reminders_meeting", "calendar_mon", "reminders_repeat_mon", "calendar_mon", "reminders_repeat_mon", "calendar_thu", "calendar_tue", "reminders_repeat_tue", "reminders_repeat_thu", "calendar_thu", "calendar_tue", "reminders_repeat_tue", "reminders_repeat_thu", "calendar_thu", "calendar_tue", "reminders_repeat_tue", "reminders_repeat_thu", "calendar_thu", "calendar_tue", "reminders_repeat_tue", "reminders_repeat_thu", "calendar_wed", "reminders_repeat_wed", "calendar_wed", "reminders_repeat_wed", "reminders_repeat_fri", "calendar_fri", "reminders_repeat_fri", "calendar_fri", "calendar_sat", "reminders_repeat_sun", "calendar_sun", "reminders_repeat_sat", "calendar_sat", "reminders_repeat_sun", "calendar_sun", "reminders_repeat_sat", "calendar_sat", "reminders_repeat_sun", "calendar_sun", "reminders_repeat_sat", "calendar_sat", "reminders_repeat_sun", "calendar_sun", "reminders_repeat_sat", "reminders_once", "ok", "ssdk_oks_cancel", "cancel", "ssdk_oks_cancel", "cancel", "save", "edit", "network_error", "nav_string", "disconnect", "setting_disconnected", "disconnect", "setting_disconnected", "setting_profile", "my_title", "setting_goals", "setting_findme", "searchBle_search", "setting_anti_lost", "setting_connect", "setting_reset", "setting_vibration", "setting_ringtone", "setting_ringtone_vibration", "setting_silence", "setting_sound", "setting_weather", "goal_distance", "goal_calorie", "setting_connect_next", "setting_connect_setup", "setting_connect_prompt2", "setting_connect_prompt4", "setting_connect_prompt6", "setting_connect_prompt7", "setting_connect_prompt8", "setting_connect_prompt3", "setting_connect_prompt5", "setting_connect_select_watch", "setting_connect_try_again", "my_gender", "my_birthday", "my_weigth", "my_heigth", "picture_image_loading", "pull_to_refresh_header_hint_ready", "ssdk_oks_release_to_refresh", "pull_to_refresh_header_hint_ready", "ssdk_oks_release_to_refresh", "pushmsg_center_pull_down_update_time", "pushmsg_center_pull_down_text", "ssdk_oks_pull_to_refresh", "save_successfully", "setting_weather_city_select", "data_details_deily_goal", "data_details_total", "disconnect_dialog_message", "disconnect_dialog_title1", "disconnect_dialog_message1", "portrait_title", "sport_report_calorie_chart_unit", "sport_report_step_chart_unit", "sport_report_pace_chart_unit", "sport_report_speed_chart_unit", "sport_report_altitude_chart_unit", "Tomorrow_hasn\'t_arrived", "Haven\'t_to_next_week", "Haven\'t_to_next_month", "Sun", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "h", "Camera", "Photo", "delete", "set_up_clock_num", "Everyday", "submit", "feedback_submit", "submit", "feedback_submit", "Modify_the_failure", "Modify_the_success", "Success", "Failure", "Watch_Face", "Break_even_remind", "Tip", "Setting_Failure", "m", "searchBle_reloadDevice", "Reload_the_BLE", "Manual_Select", "set_Automatically", "man", "woman", "fill_out_nickname", "select_gender", "set_your_birthday", "set_your_weight", "set_your_height", "kg", "lb", "cm", "Feet/inches", "data_not_synchronized", "Bluetooth_not_connected", "Disconnect_Smart_Watch", "sleep_details_bed_time", "sleep_details_light", "sleep_details_deep", "sleep_details_total", "today_heart_rate", "setting_heart", "automatic_heart_switch", "setting_heart", "automatic_heart_switch", "heart_rate_unit", "sleep_report_max_week", "sleep_report_min_week", "sleep_report_max_mon", "sleep_report_min_mon", "sleep_report_minimum", "setting_dial", "setting_skin", "sport_report_hr_zone_label", "sport_report_hr_zone_help", "sport_report_hr_zone5", "sport_report_hr_zone4", "sport_report_hr_zone3", "sport_report_hr_zone2", "sport_report_hr_zone1", "sport_pace_annotation2", "sport_report_hr_zone_label6", "sport_report_hr_zone_label7", "sport_report_hr_zone_label8", "sport_report_hr_zone_label9", "sport_report_hr_zone_label10", "share_tip", "mile_unit", "watchface_updata", "sport_speed", "share_label", "ssdk_oks_share", "share_label", "ssdk_oks_share", "export_label", "track_tip", "strava_label", "strava_tip", "pushmsg_center_pull_down_update_no_time", "setting_advancerSettings", "setting_notification", "setting_sedentary", "setting_drink", "setting_disturb", "setting_advanced_activate", "setting_wearing", "sedentary_remaind_tiplabel", "heart_remaind_tiplabel", "disturb_remaind_tiplabel", "remaind_tip", "remind_after", "remind_star", "remind_end", "remind_threshold", "setting_activate", "setting_palming", "setting_wearing_left", "setting_wearing_right", "setting_advanced_remind_screen", "setting_bright_vibration", "setting_advanced_remind", "GPS_Watch", "Smart_Watch", "Smart_Bracelet", "watchface_tip", "activity_swimming", "setting_update", "update_fail", "update_success", "update_isnew", "firmware_tip", "firmware_upgrade", "not_support_ble", "wave_his_photo", "camera_activity_save_print_failure", "camera_activity_permission", "camera_activity_hint", "sport_details_fragment_swimming_length", "sport_details_fragment_swimming_arm", "sport_details_fragment_swimming_train_number", "reminders_snooze", "sport_strava_share_succeed", "sport_strava_share_fail", "user_name", "my_name", "user_name", "my_name", "watch_disconnect_title", "watch_disconnect_go_to", "activity_sport_details_year", "history_year", "activity_sport_details_year", "history_year", "activity_sport_details_beyond", "hr_report_dangerous", "ssdk_oks_sharing", "ssdk_oks_share_failed", "ssdk_oks_share_completed", "ssdk_oks_share_canceled", "ssdk_oks_multi_share", "ssdk_oks_confirm", "ssdk_oks_contacts", "pushmsg_center_pull_down_text", "ssdk_oks_pull_to_refresh", "ssdk_oks_refreshing", "connect_applehealth", "connect", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "setting_connect_done", "update_download", "update_upgrading", "update_downfail", "update_lowpower", "update_downloadnew", "firmware_success_tip", "Turn_Off", "Turn_On", "KCTDFUNotice", "set_up_clock_max", "set_up_clock_max_num", "sport_climbing_height", "swimming_unit", "sport_report_hr_zone0", "open_bluetooth", "0", "forget_device_label1", "forget_device_label2", "forget_device_label3", "forget_device_label4", "forget_device_button2", "sleep_details_awake_time", "setting_connect_prompt1", "data_details_average", "sleep_details_avg", "setting_findme", "searchBle_search", "searchBle_instructions", "searchBle_wait", "str_main_partial", "str_main_standard", "str_main_overweight", "home_bmi_fat", "about_official", "about_privacy", "version", "about_version", "about", "entry_weight_title", "entry_weight_hint", "entry_goal_Tip", "entry_weight_lightest", "entry_weight_most", "apple_health_label", "apple_health_textview", "apple_health_go", "apple_health_later", "fragment_about_current_version", "version", "about_version", "fragment_about_mac_address", "serail_number", "firmware_check", "firmware_unfinished", "WDB_syncData", "search_paired", "setting_help", "about_comments", "setting_takephoto", "bluetooth_connot_connect", "help_Q1", "bluetooth_disconnect", "help_Q2", "bluetooth_syn_error", "help_Q3", "sleepdata_delayed", "help_Q4", "sms_notification_notwork", "help_Q5", "device_fail_steps", "help_Q6", "app_crash_constantly", "help_Q7", "wrong_weather", "help_Q8", "help_Q9", "setting_feedback", "feedback_suggestions", "feedback_performance", "feedback_style_title", "feedback_contenst", "feedback_devicetype", "firmware_tip_success", "firmware_new", "feedback_device_version", "feedback_device_name", "feedback_system_os", "devicetype_nocontents", "suggestion_nocontents", "swimming_breaststroke", "swimming_backstroke", "swimming_butterfly_stroke", "swimming_freestyle", "swimming_medley_stroke", "swimming_posture", "swimming_pool_distance", "swimming_avg_pace", "swimming_laps", "swimming_stroke_times", "swimming_swolf", "swimming_pace", "fastest", "swimming_stroke_rate", "swimming_swolf_rate", "setting_bluetoothCall", "bluetoothcall_transmission", "bluetoothcall_transmission_ans", "bluetooth_tosetting", "remind_later", "bluetoothcall_connect", "bluetoothcall_open_jurisdiction", "bluetoothcall_disconnect", "brandname_nocontents", "firmware_upgrade_notes", "help_Q10", "nopair_Q1", "nopair_A1", "nopair_Q2", "nopair_A2", "syn_data", "persion_message_explain", "feedback_brand", "feedback_issue", "entry_weight_date", "general_level", "good_level", "optimal_level", "str_main_blood", "str_main_ecg", "str_main_hrv", "main_health_vc", "detailed_report", "my_health_report", "play_start", "play_stop", "hrv_help_fatigue_title", "hrv_help_load_title", "hrv_help_quality_title", "hrv_help_heart_title", "hrv_help_title1", "hrv_help_title2", "hrv_help_health_proposal_text1", "hrv_help_health_proposal_text2", "hrv_help_health_proposal_text3", "hrv_help_fatigue_proposal_text1", "hrv_help_fatigue_proposal_text2", "hrv_help_fatigue_proposal_text3", "hrv_help_heart_proposal_text1", "hrv_help_heart_proposal_text2", "hrv_help_heart_proposal_text3", "hrv_help_load_proposal_text1", "hrv_help_load_proposal_text2", "hrv_help_load_proposal_text3", "hrv_help_quality_proposal_text1", "hrv_help_quality_proposal_text2", "hrv_help_quality_proposal_text3", "nickname", "jiaozhun_title", "measure_title", "jiaozhun_accurate", "jiaozhun_grade", "jiaozhun_text1", "jiaozhun_text2", "jiaozhun_text3", "reminder", "measure_start", "measure_stop", "measure_tuouo", "measure_zhixian", "calibration", "heart", "blood_pressure", "ecg_measure_hrv_par0", "ecg_measure_hrv_par1", "ecg_measure_hrv_par2", "jiaozhun_par1", "jiaozhun_par2", "jiaozhun_dailog_title", "blood_pressure_level", "jiaozhun_dailog_error2", "healthy_jiaozhun_prompt", "user_par_state0", "user_par_state1", "user_par_state2", "user_par_state2_1", "user_par_state3", "user_par_state4", "str_lowest", "str_highest", "blood_char_par1_text", "blood_char_par2_text", "hrv_help_title", "hrv_help_health_text", "hrv_help_fatigue_text", "hrv_help_load_text", "hrv_help_quality_text", "hrv_help_heart_text", "healthdy_blood_title", "setting_medicine", "setting_meeting", "jioazhun_error", "jiaozhun_toast", "share_pdf", "healthy_prompt_no_appera", "dialog_measure_tip1", "dialog_measure_tip2", "add_wechat_1", "add_wechat_2", "add_wechat_3", "wechat_sport", "disconnect_ota_describe1", "disconnect_ota_describe2","bluetooth_restart","bluetooth_change_phone","help_Q11"]
    
    var selectIndex:Int?
    
    let simple = Simple()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let string1 = "1.将String文件转成xml文件格式输出"
        let string2 = "2.比对文件的不同之处，比对出文件1比文件2多出部分,完全不同"
        let string3 = "3.排序,给入一个基类的文件，比对的plist文件，可以将key值排序出来"
        let string4 = "4.传入要比对的文件，可为xml格式"

        let theTextView = NSTextView(frame: textSctollView.bounds)
        theTextView.isEditable = false
        theTextView.string = "\(string1)\n\(string2)\n\(string3)\n\(string4)"
        textSctollView.addSubview(theTextView)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func segmentedControlAction(_ sender: NSSegmentedControl) {
        selectIndex = sender.selectedSegment
        
        switch selectIndex {
        case 0:
            sortFileTextField.isHidden = true
            completeTextField.isHidden = true
        case 1:
            completeTextField.isHidden = false
            sortFileTextField.isHidden = false
        case 2:
            completeTextField.isHidden = true
            sortFileTextField.isHidden = false
        case 3:
            completeTextField.isHidden = false
            sortFileTextField.isHidden = false
        default:
            sortFileTextField.isHidden = false
            completeTextField.isHidden = false
        }
        
    }
    
    @IBAction func submitAction(_ sender: NSButton) {
        
        switch selectIndex {
        case 0:
            
            simple.transLate(fieldPath: baseTextField.stringValue)
           
        case 1:
            
            simple.comparisonAndSort(baseField: baseTextField.stringValue, completeField: completeTextField.stringValue, SortArray: nameList, needaffirm: true) {[unowned self] (string)  in
                self.simple.showAlertError(string: string, needContinue: { () -> (Void) in
                    self.simple.comparisonAndSort(baseField: self.baseTextField.stringValue, completeField: self.completeTextField.stringValue, SortArray: self.nameList, needaffirm: false, returnString: nil)
                })
            }
        case 2:
            break
        case 3:
            if !completeTextField.stringValue.hasSuffix(".xml") {
                simple.showAlertError(string: "比对文件不是xml格式", needContinue: nil)
                return
            }
            simple.comparisonAndSortWithXml(baseField: baseTextField.stringValue, completeField: completeTextField.stringValue, SortArray: nameList, needaffirm: true) {[unowned self] (string) in
                self.simple.showAlertError(string: string, needContinue: { () -> (Void) in
                    self.simple.comparisonAndSortWithXml(baseField: self.baseTextField.stringValue, completeField: self.completeTextField.stringValue, SortArray: self.nameList, needaffirm: false, returnString: nil)
                })
            }
            
        default:
            break
        }
       
        
    }
    
    
   
}

