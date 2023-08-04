{{/*
Return the appropriate sidecar images based on k8s version
*/}}
{{- define "csi-unity.attacherImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-attacher:v4.3.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.provisionerImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-provisioner:v3.5.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.snapshotterImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-snapshotter:v6.2.2" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.resizerImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-resizer:v1.8.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.registrarImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-node-driver-registrar:v2.8.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.healthmonitorImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "27") -}}
      {{- print "registry.k8s.io/sig-storage/csi-external-health-monitor-controller:v0.9.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Return true if storage capacity tracking is enabled and is supported based on k8s version
*/}}
{{- define "csi-unity.isStorageCapacitySupported" -}}
{{- if eq .Values.storageCapacity.enabled true -}}
  {{- if and (eq .Capabilities.KubeVersion.Major "1") (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "24") -}}
      {{- true -}}
  {{- end -}}
{{- end -}}
{{- end -}}
