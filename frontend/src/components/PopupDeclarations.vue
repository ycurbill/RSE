<template>
    <!-- Popup -->
    <v-dialog max-width="290">
        <v-card>
            <v-card-title class="headline">{{ name }}</v-card-title>
            <!-- List of indicators displayed -->
            <v-list>
                <v-list-item v-for="indicator in indicators" :key="indicator.id">
                        <v-list-item-title>{{ indicator.name }} / {{ indicator.precision }}</v-list-item-title>
                        <v-list-item-subtitle>{{ indicator.value }}</v-list-item-subtitle>
                </v-list-item>
            </v-list>
            <!-- Button to close popup -->
            <v-card-actions>
                <v-btn color="green" text @click="closeDialog">Fermer</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>

    export default {
        props: ['title', 'name', 'description', 'indicators'],
        data() {
            return {
                date: null,
                partner: null,
                weight: null,
                participants: null,
                options: ['Asso1', 'Asso2']
            };
        },
        methods: {
            closeDialog() {
                this.$emit('close');
            },
        },
    }
</script>