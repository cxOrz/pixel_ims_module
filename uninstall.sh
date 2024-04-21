file_path="/data/user_de/0/com.android.phone/files/"
find $file_path -maxdepth 1 -type f -name "carrierconfig-com.google.android.carrier*.xml" ! -name "*nosim*" | while read -r file; do
  if grep -q '</bundle>' "$file"; then
      sed -i '/<!--PIXEL_IMS_MODULE_START-->/,/<!--PIXEL_IMS_MODULE_END-->/d' "$file"
      echo "Deleted config items in $file"
  else
    echo "No </bundle> tag found in $file. Skipping."
  fi
done
