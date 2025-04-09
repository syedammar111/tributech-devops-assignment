{{/*
Generate the name of the chart
*/}}
{{- define "pgadmin.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Generate the fullname of the chart
*/}}
{{- define "pgadmin.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Generate the chart name and version
*/}}
{{- define "pgadmin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end -}}

{{/*
Generate the labels for the chart
*/}}
{{- define "pgadmin.labels" -}}
app.kubernetes.io/name: {{ include "pgadmin.name" . }}
helm.sh/chart: {{ include "pgadmin.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}