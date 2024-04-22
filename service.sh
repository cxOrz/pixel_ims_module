file_path="/data/user_de/0/com.android.phone/files/"
insert_string=\
"<!--PIXEL_IMS_MODULE_START-->\n"\
"<boolean name=\"carrier_volte_available_bool\" value=\"true\" />\n"\
"<boolean name=\"carrier_vt_available_bool\" value=\"true\" />\n"\
"<boolean name=\"carrier_wfc_ims_available_bool\" value=\"true\" />\n"\
"<boolean name=\"carrier_wfc_supports_wifi_only_bool\" value=\"true\" />\n"\
"<boolean name=\"editable_enhanced_4g_lte_bool\" value=\"true\" />\n"\
"<boolean name=\"enhanced_4g_lte_on_by_default_bool\" value=\"true\" />\n"\
"<boolean name=\"editable_wfc_mode_bool\" value=\"true\" />\n"\
"<boolean name=\"editable_wfc_roaming_mode_bool\" value=\"true\" />\n"\
"<boolean name=\"hide_lte_plus_data_icon_bool\" value=\"false\" />\n"\
"<boolean name=\"show_4g_for_lte_data_icon_bool\" value=\"true\" />\n"\
"<boolean name=\"vonr_enabled_bool\" value=\"true\" />\n"\
"<boolean name=\"vonr_setting_visibility_bool\" value=\"true\" />\n"\
"<!--PIXEL_IMS_MODULE_END-->"

find $file_path -maxdepth 1 -type f -name "carrierconfig-com.google.android.carrier*.xml" ! -name "*nosim*" | while read -r file; do
  if grep -q '</bundle>' "$file"; then
      if grep -q 'PIXEL_IMS_MODULE' "$file"; then
        echo "Replace with the latest config."
        sed -i "/<!--PIXEL_IMS_MODULE_START-->/,/<!--PIXEL_IMS_MODULE_END-->/c\\$insert_string" $file
      else
        sed -i "/<\/bundle>/i $insert_string" $file
        echo "Inserted test string into $file."
      fi
  else
      echo "No </bundle> tag found in $file. Skipping."
  fi
done


echo "Procedure complete."