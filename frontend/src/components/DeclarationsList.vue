<template>
    <div>
        <v-list>
            <v-list-item v-for="(action, index) in actions" :key="action.id" style="padding: 10px; margin: 10px; border: 1px solid red;">
                <v-list-item-title>{{ action.name }}</v-list-item-title>
                <v-list-item-subtitle>{{ action.description }}</v-list-item-subtitle>
                    <v-btn @click="dialogs[index] = true" elevation="5">Voir les indicateurs</v-btn>
                    <PopupDeclarations v-model="dialogs[index]" @close="dialogs[index] = false" :name="action.name" :description="action.description" :indicators="action.indicators" />
            </v-list-item>
        </v-list>
        <v-card-text>
            <p>Nouvel indicateur</p>
            <v-text-field v-model="name" label='Intitulé (ex: "poids", "participants")'></v-text-field>
            <v-text-field v-model="precision" label='Précision (ex: "kg", "€", "nombre")'></v-text-field>
            <!-- <v-text-field v-model="value" label="Valeur"></v-text-field> -->
            <v-btn color="primary" @click="addData">Add</v-btn>
        </v-card-text>
    </div>
</template>

<script>
    import axios from 'axios';
    import PopupDeclarations from './PopupDeclarations.vue';

    export default {
        components: {
            PopupDeclarations,
        },
        data: () => ({
                dialogs: [],
                actions: [],
                name: null,
                precision: null,
                // value: null,
        }),
        created() {
            axios.get('http://localhost:3000/get-actions')
                .then(response => {
                    this.actions = response.data;
                    this.dialogs = new Array(this.actions.length).fill(false);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        methods: {
            addData() {
                let data = {
                    name: this.name,
                    precision: this.precision,
                };

                axios.post('http://localhost:3000/new-indicator', data)
                    .then(function (response) {
                        console.log('Response from server:', response);
                    })
                    .catch(function (error) {
                        console.log('Error:', error);
                    });
            },
        },
    };
</script>