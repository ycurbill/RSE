<template>
 <v-dialog max-width="290">
  <v-card>
    <v-card-title class="headline">{{ title }}</v-card-title>
    <v-card-text>
        <v-form>
            <v-date-picker v-model="date" label="Date de la collecte"></v-date-picker>
            <v-select v-model="partner" :items="options" label="Partenaire"></v-select>
            <v-list>
                <v-list-item v-for="indicator in indicators" :key="indicator.id" style="padding: 10px; margin: 10px; border: 1px solid red;">
                    <v-list-item-title>
                        {{ indicator.name }} ({{ indicator.precision }})
                    </v-list-item-title>
                    <v-text-field v-model="indicator.value"></v-text-field>
                </v-list-item>
            </v-list>
        </v-form>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color="primary" text @click="closeDialog">Fermer</v-btn>
      <v-btn color="primary" text @click="addAction">Ajouter</v-btn>
    </v-card-actions>
  </v-card>
 </v-dialog>
</template>

<script>
    import axios from 'axios';
    import async from 'async';

    const queue = async.queue((indicatorData, callback) => {
    axios.post('http://localhost:3000/add-indicator', indicatorData)
        .then(response => {
            console.log(response);
            callback();
        })
        .catch(error => {
            console.log(error);
            callback();
        });
    }, 1); // The concurrency value is 1

    export default {
        props: ['title', 'name', 'description'],
        data() {
            return {
                dialog: true,
                date: null,
                partner: null,
                indicators: [],
                options: ['Asso1', 'Asso2'],
                // indicatorsData: [],
            };
        },
        created() {
                axios.get('http://localhost:3000/get-indicators')
                    .then(res => {
                        const allIndicators = Object.values(res.data);
                        // const uniqueIndicators = allIndicators.reduce((unique, indicator) => {
                        //     const key = `${indicator.name}-${indicator.precision}`;
                        //     if (!unique[key]) {

                        //         unique[indicator.name] = indicator;
                        //     }
                        //     return unique;
                        // }, {});

                        // const allIndicatorsArray = Object.values(allIndicators);
                        //delete uniqueIndicatorsArray.action_id;
                        console.log("1111", allIndicators);
                        allIndicators.map(indicator => {
                            delete indicator.id;
                            delete indicator.updated_at;
                            delete indicator.created_at;
                            indicator['value'] = null;
                        })
                        this.indicators.push(...allIndicators);
                        console.log("222", this.indicators);
                        //this.indicatorsData = uniqueIndicators;
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

                    //this.indicatorsData['action_id'] = response.data.id;
                    // Add each indicatorData to the queue
                    this.indicators.forEach(indicator => {
                        indicator['action_id'] = response.data.id;
                        queue.push(indicator);
                    });

                    // Execute the callback when the queue is done processing all the tasks
                    queue.drain(() => {
                        console.log('Successfully processed all items');
                    });
                } catch (error) {
                    console.log(error);
                }
            }
        },
    }
</script>