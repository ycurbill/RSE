<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <v-app>
    <v-app-bar app>
      <router-link to="/">
        <v-btn color="primary">Actions</v-btn>
      </router-link>
      <router-link to="/about">
        <v-btn color="primary">Declarations</v-btn>
      </router-link>
   </v-app-bar>

    <v-main>
      <v-container fill-height fluid>
        <v-row align="center" justify="center" style="border: 1px solid blue;">
          <v-col style="border: 1px solid red;">
            <RouterView />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<style scoped>

</style>
