<script setup lang="ts">
import { useAnimations, useGLTF } from '@tresjs/cientos';
import { useTexture } from '@tresjs/core';
import { MeshStandardMaterial } from 'three'
import { ref } from 'vue';

const { nodes, animations } = await useGLTF('/models/astronaut.glb', { draco: true })

const astronaut = nodes['Astronaut']

const bakedTexture = await useTexture(['/models/astronaut-baked.png'])
bakedTexture.flipY = false

const material = new MeshStandardMaterial({
  map: bakedTexture,
})

astronaut.material = material

const { actions, mixer } = useAnimations(animations, astronaut)

const currentAction = ref(actions['Floating'])

currentAction.value.play()
</script>

<template>
  <TresGroup
    :rotation="[0, -Math.PI / 8, Math.PI / 12]"
  >
    <primitive :object="astronaut" />
  </TresGroup>
</template>