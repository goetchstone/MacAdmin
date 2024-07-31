#!/bin/bash

# Check if the required arguments are provided
if [ "$#" -eq 7 ]; then
    if [[ "${@: -1}" == "--dry-run" ]]; then
        echo "If there are 7 arguments, '--dry-run' should be the 8th argument."
        exit 1
    fi
elif [ "$#" -ne 8 ]; then
    echo "Usage: $0 FIRST_NAME LAST_NAME EMAIL TEMP_PASSWORD EMPLOYEE_TITLE PHONE_NUMBER ROLE [--dry-run]"
    exit 1
fi

# Check for dry-run flag
DRY_RUN=false
if [ "$#" -eq 8 ] && [ "${@: -1}" == "--dry-run" ]; then
    DRY_RUN=true
    echo "Dry run mode activated. No changes will be made."
fi

# Define the GAM command and configuration path
GAM_CMD=""
GAMCFGDIR=""
export GAMCFGDIR

# Assign command-line arguments to variables
FIRST_NAME="$1"
LAST_NAME="$2"
EMAIL="$3"
TEMP_PASSWORD="$4"
EMPLOYEE_TITLE="$5"
PHONE_NUMBER="$6"
ROLE="$7"

# Define remaining variables (for customization)
BUSINESS_NAME=""
BUSINESS_WEBSITE=""
LOGO_SRC=""
EMPLOYEE_NAME="$FIRST_NAME $LAST_NAME"
EMPLOYEE_EMAIL="$EMAIL"
STORE_ADDRESS=""
FACEBOOK_URL=""
FACEBOOK_IMG_SRC=""
INSTAGRAM_URL=""
INSTAGRAM_IMG_SRC=""
PINTEREST_URL=""
PINTEREST_IMG_SRC=""
YOUTUBE_URL=""
YOUTUBE_IMG_SRC=""

# Define default groups for all roles
DEFAULT_GROUPS=("")

# Define role-based groups (customize as needed)
declare -A ROLE_GROUPS
ROLE_GROUPS[ROLE1]=("")
ROLE_GROUPS[ROLE2]=("")
ROLE_GROUPS[ROLE3]=("")
ROLE_GROUPS[ROLE4]=("")
ROLE_GROUPS[ROLE5]=("")

# Create the HTML content signature file
HTML_CONTENT="<html>
  <body>
    <div>
      <h5>Kind Regards</h5>
    </div>
    <div dir=\"ltr\">
      <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:-webkit-baseline-middle;font-family:Georgia\">
        <tbody>
          <tr>
            <td style=\"vertical-align:top\">
              <table cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align:-webkit-baseline-middle;font-family:Georgia\">
                <tbody>
                  <tr>
                    <td style=\"text-align:center\">
                      <a href=\"#\" target=\"_blank\">
                        <img src=\"$LOGO_SRC\" style=\"max-width:90px;display:block\">
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
            <td width=\"15\"></td>
            <td style=\"padding:0px;vertical-align:middle\">
              <h3 color=\"#000000\" style=\"margin:0px;font-size:16px;color:rgb(0,0,0)\">
                <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-weight:normal;font-family:Georgia\">
                  <tbody>
                    <tr>
                      <td style=\"line-height:1.08\">
                        <span style=\"font-size:12px;font-family:Georgia;font-weight:bold\">$EMPLOYEE_NAME</span>
                        <span style=\"font-size:12px;letter-spacing:0px;font-family:Georgia;text-transform:initial\">$EMPLOYEE_TITLE</span>
                        <span style=\"font-size:12px;letter-spacing:0px;font-family:Georgia;text-transform:initial\"> at $BUSINESS_NAME</span>
                      </td>
                    </tr>
                    <tr>
                      <td style=\"line-height:0;padding-top:10px;padding-bottom:10px\">
                        <table cellspacing=\"0\" cellpadding=\"0\" style=\"width:387px\">
                          <tbody>
                            <tr>
                              <td style=\"line-height:0;font-size:1pt;border-bottom-width:2px;border-bottom-style:solid;border-bottom-color:rgb(0,0,0)\"></td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td style=\"line-height:0\">
                        <table cellpadding=\"0\" cellspacing=\"0\">
                          <tbody>
                            <tr>
                              <td>
                                <table cellpadding=\"0\" cellspacing=\"0\">
                                  <tbody>
                                    <tr>
                                      <td style=\"line-height:0px;padding-bottom:4px\">
                                        <table cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:14px;font-size:12px;font-family:Georgia\">
                                          <tbody>
                                            <tr>
                                              <td style=\"font-family:Georgia\">
                                                <a href=\"tel:$PHONE_NUMBER\" style=\"text-decoration:none\" target=\"_blank\">
                                                  <span style=\"line-height:1.2;color:rgb(33,33,33);white-space:nowrap\">$PHONE_NUMBER</span>
                                                </a>
                                              </td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                      <td style=\"line-height:0px;padding-bottom:4px\">
                                        <table cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:14px;font-size:12px;font-family:Georgia\">
                                          <tbody>
                                            <tr>
                                              <td style=\"padding:0px 4px\">
                                                <span style=\"font-family:Georgia;font-weight:bold;color:rgb(33,33,33);vertical-align:2px\">|</span>
                                              </td>
                                              <td style=\"font-family:Georgia\">
                                                <a href=\"#\" style=\"text-decoration:none\" target=\"_blank\">
                                                  <span style=\"line-height:1.2;color:rgb(33,33,33);white-space:nowrap\">$BUSINESS_WEBSITE</span>
                                                </a>
                                              </td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                      <td style=\"line-height:0px;padding-bottom:4px\">
                                        <table cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:14px;font-size:12px;font-family:Georgia\">
                                          <tbody>
                                            <tr>
                                              <td style=\"padding:0px 4px\">
                                                <span style=\"font-family:Georgia;font-weight:bold;color:rgb(33,33,33);vertical-align:2px\">|</span>
                                              </td>
                                              <td style=\"font-family:Georgia\">
                                                <a href=\"mailto:$EMPLOYEE_EMAIL\" style=\"text-decoration:none\" target=\"_blank\">
                                                  <span style=\"line-height:1.2;color:rgb(33,33,33);white-space:nowrap\">$EMPLOYEE_EMAIL</span>
                                                </a>
                                              </td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <table cellpadding=\"0\" cellspacing=\"0\">
                                  <tbody>
                                    <tr>
                                      <td style=\"line-height:0px;padding-bottom:4px\">
                                        <table cellpadding=\"0\" cellspacing=\"0\" style=\"line-height:14px;font-size:12px;font-family:Georgia\">
                                          <tbody>
                                            <tr>
                                              <td style=\"font-family:Georgia\">
                                                <span style=\"line-height:1.2;color:rgb(33,33,33);white-space:nowrap\">$STORE_ADDRESS</span>
                                              </td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </td>
                                    </tr>
                                  </tbody>
                                </table>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </h3>
              <a href=\"$FACEBOOK_URL\" target=\"_blank\"><img width=\"22\" height=\"22\" src=\"$FACEBOOK_IMG_SRC\" border=\"0\" style=\"border:none; margin:5px\"></a>
              <a href=\"$INSTAGRAM_URL\" target=\"_blank\"><img width=\"22\" height=\"22\" src=\"$INSTAGRAM_IMG_SRC\" border=\"0\" style=\"border:none; margin:5px\"></a>
              <a href=\"$YOUTUBE_URL\" target=\"_blank\"><img width=\"22\" height=\"22\" src=\"$YOUTUBE_IMG_SRC\" border=\"0\" style=\"border:none; margin:5px\"></a>
              <a href=\"$PINTEREST_URL\" target=\"_blank\"><img width=\"22\" height=\"22\" src=\"$PINTEREST_IMG_SRC\" border=\"0\" style=\"border:none; margin:5px\"></a>
            </td>
          </tr>
        </tbody>
      </table>
      <br>
    </div>
  </body>
</html>"

# Save the content to an HTML file
SIGNATURE_FILE="${EMPLOYEE_NAME// /_}.html"
echo "$HTML_CONTENT" > "$SIGNATURE_FILE"

# Create user using GAM
if [ "$DRY_RUN" = false ]; then
    $GAM_CMD create user "$EMAIL" firstname "$FIRST_NAME" lastname "$LAST_NAME" password "$TEMP_PASSWORD"

    # Assign groups to the user
    GROUPS_TO_ASSIGN=("${DEFAULT_GROUPS[@]}" "${ROLE_GROUPS[$ROLE]}")

    for GROUP in "${GROUPS_TO_ASSIGN[@]}"; do
        $GAM_CMD add user "$EMAIL" to group "$GROUP"
    done
fi

# Notify user of success
echo "User $EMAIL created, signature updated,
