set -ex
echo "build path "${build_path}""

curl --location --request POST 'https://public.sofy.ai/parser-microservice/build-upload' \
--header "x-sofy-auth-key: ${subscription_key}" \
--form "applicationFile=@"${build_path}"" \
--form "ApplicationGUID="${application_guid}"" \
--form "CertificateName="${certificate_name}""