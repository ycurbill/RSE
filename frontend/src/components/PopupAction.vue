<template>
    <!-- Popup -->
    <v-dialog max-width="290">
        <v-card>
            <v-card-title class="headline">{{ title }}</v-card-title>
                <v-card-text>
                    <v-form>
                        <v-date-picker v-model="date" label="Date de la collecte"></v-date-picker>
                        <v-select v-model="partner" :items="options" label="Partenaire"></v-select>
                        <!-- List of indicators asked by RSE manager -->
                        <v-list>
                            <v-list-item v-for="indicator in indicators" :key="indicator.id" style="padding: 10px; margin: 10px;">
                                <v-list-item-title>
                                    {{ indicator.name }} ({{ indicator.precision }})
                                </v-list-item-title>
                                <v-text-field v-model="indicator.value"></v-text-field>
                            </v-list-item>
                        </v-list>
                    </v-form>
                </v-card-text>
            <!-- Buttons -->
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="green" text @click="closeDialog">Fermer</v-btn>
                <v-btn color="green" text @click="addAction">Ajouter</v-btn>
            </v-card-actions>
        </v-card>
    </v-dialog>
</template>

<script>
    import axios from 'axios';
    import async from 'async';

    // To avoid doing more than 1 request at the same time to SQLite as it cannot deal with that
    const queue = async.queue((indicatorData, callback) => {
    axios.post('http://localhost:3000/add-indicator', indicatorData)
        .then(response => {
            console.log('Response from server:', response);
            callback();
        })
        .catch(error => {
            console.log('Error:', error);
            callback();
        });
    }, 1); // concurrency value

    export default {
        props: ['title', 'name', 'description'],
        data() {
            return {
                dialog: true,
                date: null,
                partner: null,
                indicators: [],
                options: ['Asso1', 'Asso2', 'Asso3'],
            };
        },
        created() {
            axios.get('http://localhost:3000/get-indicators')
                .then(res => {
                    const allIndicators = Object.values(res.data);
                    allIndicators.map(indicator => {
                        delete indicator.id;
                        delete indicator.updated_at;
                        delete indicator.created_at;
                        indicator['value'] = null;
                    })
                    this.indicators.push(...allIndicators);
                })
        },
        methods: {
            closeDialog() {
                this.dialog = false;
                this.$emit('close');
            },
            async addAction() {
                let data = {
                    "name": this.name,
                    "description": this.description,
                    "date": this.date,
                    "partner": this.partner,
                };

                try {
                    const response = await axios.post('http://localhost:3000/add-action', data);
                    this.closeDialog();

                    this.indicators.forEach(indicator => {
                        indicator['action_id'] = response.data.id;
                        queue.push(indicator);
                    });
                } catch (error) {
                    console.log(error);
                }
            }
        },
    }
</script>