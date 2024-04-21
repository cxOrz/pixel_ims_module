file_path="/data/user_de/0/com.android.phone/files/"
insert_string=\
"<!--PIXEL_IMS_MODULE_START-->\n"\
"<boolean name=\"enhanced_4g_lte_on_by_default_bool\" value=\"true\" />\n"\
"<boolean name=\"carrier_volte_available_bool\" value=\"true\" />\n"\
"<boolean name=\"vendor_hide_volte_settng_ui\" value=\"false\" />\n"\
"<boolean name=\"hide_lte_plus_data_icon_bool\" value=\"false\" />\n"\
"<boolean name=\"vonr_enabled_bool\" value=\"true\" />\n"\
"<boolean name=\"vonr_setting_visibility_bool\" value=\"true\" />\n"\
"<boolean name=\"show_4g_for_lte_data_icon_bool\" value=\"true\" />\n"\
"<!--PIXEL_IMS_MODULE_END-->"

find $file_path -maxdepth 1 -type f -name "carrierconfig-com.google.android.carrier*.xml" ! -name "*nosim*" | while read -r file; do
  if grep -q '</bundle>' "$file"; then
      if grep -q 'PIXEL_IMS_MODULE' "$file"; then
        echo "Config already inserted, skip now."
      else
        sed -i "/<\/bundle>/i $insert_string" "$file"
        echo "Inserted test string into $file."
      fi
  else
      echo "No </bundle> tag found in $file. Skipping."
  fi
done


echo "Procedure complete."