{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "theia.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "theia.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "theia.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "theia.labels" -}}
helm.sh/chart: {{ include "theia.chart" . }}
{{ include "theia.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "theia.selectorLabels" -}}
app.kubernetes.io/name: {{ include "theia.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "theia.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "theia.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Get the image name
*/}}
{{- define "theia.image" -}}
{{- $tag := default (include "theia.tag" .) .Values.image.tag -}}
{{- $runtimes := list "nodejs" "go" "php" "dart" "cpp" "java" "rust" "python" "full" -}}

{{if has .Values.runtime $runtimes }}
   {{- if eq .Values.runtime "nodejs" -}}
   {{- printf "%s:%s" .Values.image.repository $tag -}}
   {{- else -}}
   {{- printf "%s-%s:%s" .Values.image.repository .Values.runtime $tag -}}
   {{- end -}}
{{- else -}}
    {{- fail (printf "%s is not a valid runtime. Valid values are: %s" .Values.runtime $runtimes) -}}
{{- end -}}
{{- end -}}

{{/*
Get the image tag based on the runtime
*/}}
{{- define "theia.tag" -}}
{{ if eq .Values.runtime "java" }}
    {{- printf "1.6.0-next.e36195e0" -}}
{{ else if eq .Values.runtime "rust" }}
    {{- printf "1.10.0-next.85aa2d5d" -}}
{{ else }}
    {{- printf "1.10.0" -}}
{{- end -}}
{{- end -}}
