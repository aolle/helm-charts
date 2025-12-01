{{- define "gitea.fullname" -}}
{{- printf "%s-gitea" .Release.Name -}}
{{- end -}}
