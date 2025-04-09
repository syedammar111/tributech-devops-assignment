{{/*
Generate a fully qualified name for the keycloak chart.
*/}}
{{- define "keycloak.fullname" -}}
{{- printf "%s-%s" .Release.Name "keycloak" | trunc 63 | trimSuffix "-" -}}
{{- end -}}