Shader "Custom/05_rim_lighting"
{
	Properties
	{
		_RimColor("Rim Color", Color) = (1, 1, 1, 1)
	}
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard
        #pragma target 3.0

        struct Input
        {
			float2 uv_MainTex;
			float3 worldNormal;
			float3 viewDir;
        };

		fixed4 _RimColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			fixed4 baseColor = fixed4(0.05, 0.1, 0, 1);
			//fixed4 rimColor = fixed4(0.5, 0.7, 0.5, 1);
			fixed4 rimColor = _RimColor;

			o.Albedo = baseColor;
			//float rim = 1 - saturate(dot(IN.viewDir, o.Normal));
			float rim = 1 - saturate(dot(IN.viewDir, IN.worldNormal));
			//o.Emission = rimColor * rim;

			// 光の減衰の調整
			o.Emission = rimColor * pow(rim, 3);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
