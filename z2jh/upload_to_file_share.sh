FILE_SHARE_NAME=notebooks
SAS_TOKEN_END_DATE=$(date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ')
SAS_TOKEN=$(az storage share generate-sas \
      --name $FILE_SHARE_NAME \
      --account-name $STORAGE_ACCOUNT_NAME \
      --account-key $STORAGE_ACCOUNT_KEY \
      --https-only \
      --permissions dlrw \
      --expiry $SAS_TOKEN_END_DATE \
      -o tsv)

DESTINATION_URL=https://$STORAGE_ACCOUNT_NAME.file.core.windows.net/$FILE_SHARE_NAME/?$SAS_TOKEN

./azcopy_linux_amd64_10.5.0/azcopy copy 'notebooks/*' $DESTINATION_URL --recursive

# az storage share list \
# --account-key $STORAGE_ACCOUNT_KEY \
# --account-name $STORAGE_ACCOUNT_NAME 

FILE_SHARE_NAME=uitemplates
SAS_TOKEN_END_DATE=$(date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ')
SAS_TOKEN=$(az storage share generate-sas \
      --name $FILE_SHARE_NAME \
      --account-name $STORAGE_ACCOUNT_NAME \
      --account-key $STORAGE_ACCOUNT_KEY \
      --https-only \
      --permissions dlrw \
      --expiry $SAS_TOKEN_END_DATE \
      -o tsv)

DESTINATION_URL=https://$STORAGE_ACCOUNT_NAME.file.core.windows.net/$FILE_SHARE_NAME/?$SAS_TOKEN

./azcopy_linux_amd64_10.5.0/azcopy copy 'uitemplates/*' $DESTINATION_URL --recursive

FILE_SHARE_NAME=modules
SAS_TOKEN_END_DATE=$(date -u -d "30 minutes" '+%Y-%m-%dT%H:%MZ')
SAS_TOKEN=$(az storage share generate-sas \
      --name $FILE_SHARE_NAME \
      --account-name $STORAGE_ACCOUNT_NAME \
      --account-key $STORAGE_ACCOUNT_KEY \
      --https-only \
      --permissions dlrw \
      --expiry $SAS_TOKEN_END_DATE \
      -o tsv)

DESTINATION_URL=https://$STORAGE_ACCOUNT_NAME.file.core.windows.net/$FILE_SHARE_NAME/?$SAS_TOKEN

./azcopy_linux_amd64_10.5.0/azcopy copy 'lmod/modules/*' $DESTINATION_URL --recursive

