{{/*
Generate a fully qualified name for the website chart.
*/}}
{{- define "website.fullname" -}}
{{- printf "%s-%s" .Release.Name "website" | trunc 63 | trimSuffix "-" -}}
{{- end -}}