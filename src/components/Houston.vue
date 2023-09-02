<script setup lang="ts">
import { ShaderMaterial, Box3 } from 'three';
import { useSeek, useRenderLoop } from '@tresjs/core';
import { useGLTF } from '@tresjs/cientos';
import vertexShader from '../shaders/houston/vertex.glsl'
import fragmentShader from '../shaders/houston/fragment.glsl'

const { nodes, materials } = await useGLTF('/models/houston.glb', { draco: true })

const model = nodes['Houston']

const { seekByName } = useSeek()
const inside = seekByName(model, 'Roundcube')
const outline = seekByName(model, 'Roundcube_1')

const bbox = new Box3().setFromObject(model);

outline.material = new ShaderMaterial({
    vertexShader,
    fragmentShader,
    uniforms: {
        bboxMin: { value: bbox.min },
        bboxMax: { value: bbox.max },
    }
})

</script>

<template>
  <primitive :object="model" />
</template>