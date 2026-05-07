{{/*
Expand the name of the chart.
*/}}
{{- define "fbi-crime-analyst-gateway.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "fbi-crime-analyst-gateway.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "fbi-crime-analyst-gateway.labels" -}}
helm.sh/chart: {{ include "fbi-crime-analyst-gateway.name" . }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "fbi-crime-analyst-gateway.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "fbi-crime-analyst-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fbi-crime-analyst-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
