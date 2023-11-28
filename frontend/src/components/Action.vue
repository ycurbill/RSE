<template>
    <!-- Action -->
    <v-row>
        <v-col cols="12" md="6">
            <v-card
                elevation="4"
                outlined
                shaped
                style="padding: 10px"
            >
                <v-col cols="12" md="12">
                    <v-row>
                        <v-col cols="4">
                            IMG
                        </v-col>
                        <v-col cols="8">
                            <v-card-title>{{ name }}</v-card-title>
                            <v-card-text>{{ description }}</v-card-text>
                            <v-card-actions>
                                <v-btn @click="dialog = true" elevation="2" color="green">Déclarer</v-btn>
                                <PopupAction v-model="dialog" @close="dialog = false" :name="name" :description="description"/> 
                            </v-card-actions>
                        </v-col>
                    </v-row>
                </v-col>
            </v-card>
        </v-col>
    </v-row>
</template>

<script>
    import PopupAction from './PopupAction.vue'

    export default {
        components: {
            PopupAction
        },
        data: () => ({
            dialog: false,
            name: "Collecte de denrées alimentaires",
            description: "description",
        })
    }
</script>