﻿Shader "Custom/03_semitranparent"
{
	Properties
	{
		_Alpha("Alpha", Range(0, 1)) = 1
	}
    SubShader
    {
        Tags { "Queue"="Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

		float _Alpha;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
			o.Albedo = fixed4(0.6f, 0.7f, 0.4f, 1);
			o.Alpha = _Alpha;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
