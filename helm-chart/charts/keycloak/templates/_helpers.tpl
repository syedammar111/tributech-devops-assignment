{{/*
Generate the name of the chart
*/}}
{{- define "keycloak.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Generate the fullname of the chart
*/}}
{{- define "keycloak.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Generate the chart name and version
*/}}
{{- define "keycloak.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end -}}

{{/*
Generate the labels for the chart
*/}}
{{- define "keycloak.labels" -}}
app.kubernetes.io/name: {{ include "keycloak.name" . }}
helm.sh/chart: {{ include "keycloak.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}