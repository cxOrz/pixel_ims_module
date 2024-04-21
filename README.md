# Pixel_IMS_MODULE
A magisk module enables VoLTE, VoNR, Wifi Calling and some enhanced features for Pixel devices.

## How to use
Just install the module through Magisk App then reboot, open SIM Setting and turn on the options you need.

1. Download the latest [pixel_ims_module.zip](https://github.com/cxOrz/pixel_ims_module/releases).
2. Install the zip file using your **Magisk App**.
3. Reboot your device.

## Modify Details
Add some boolean configs in carrier config files, this will have minimal impact on the system.

You can find your carrier config files in the directory: `/data/user_de/0/com.android.phone/files/`.

- `carrier_volte_available_bool`: Flag specifying whether VoLTE should be available for carrier, independent of carrier provisioning.
- `carrier_vt_available_bool`: Flag specifying whether video telephony is available for carrier.
- `carrier_wfc_ims_available_bool`: Flag specifying whether WFC over IMS should be available for carrier: independent of carrier provisioning.
- `carrier_wfc_supports_wifi_only_bool`: Flag specifying whether WFC over IMS supports the "wifi only" option.
- `editable_enhanced_4g_lte_bool`: Determine whether user can toggle Enhanced 4G LTE Mode in Settings.
- `editable_wfc_mode_bool`: Determine whether user can switch Wi-Fi preferred or Cellular preferred in calling preference.
- `editable_wfc_roaming_mode_bool`: Determine whether user can change Wi-Fi Calling preference in roaming.
- `hide_lte_plus_data_icon_bool`: Boolean indicating if LTE+ icon should be shown if available.
- `show_4g_for_lte_data_icon_bool`: Boolean indicating if default data account should show LTE or 4G icon.
- `vonr_enabled_bool`: Flag specifying whether VoNR should be enabled for carrier.
- `vonr_setting_visibility_bool`: Boolean indicating if the VoNR setting is visible in the Call Settings menu.

## Availability

**Tested on:**
- Pixel 7

**Works on(theoretically):**
- Pixel 6 / 6a / 6Pro
- Pixel 7 / 7a / 7Pro
- Pixel 8 / 8Pro
- Pixel Fold
