<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <!-- Navigation -->
  <v-app>
    <v-app-bar app>
      <router-link to="/">
        <v-btn color="green">Actions</v-btn>
      </router-link>
      <router-link to="/about">
        <v-btn color="green">Declarations</v-btn>
      </router-link>
   </v-app-bar>
  <!-- Page -->
    <v-main>
      <v-container fill-height fluid>
        <v-row align="center" justify="center">
          <v-col>
            <RouterView />
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<style scoped>

</style>
