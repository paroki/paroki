<template>
    <v-dialog
        v-model="dialog"
        persistent
    >
        <c-card>
            <v-card-title
                class="headline red lighten-2"
                primary-title
            >
                {{ title }}
            </v-card-title>

            <v-card-text>
                {{ content }}
            </v-card-text>

            <v-divider></v-divider>

            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                    color="red"
                    flat
                    @click.native="agree"
                >
                    Ya
                </v-btn>
                <v-btn
                    color="success"
                    flat
                    @click.native="cancel"
                >
                    Tidak
                </v-btn>
            </v-card-actions>
        </c-card>
    </v-dialog>
</template>

<script>
    export default {
        name: 'c-simple-dialog',
        props: {
            button: {
                type: String,
                default: null
            },
            title: {
                type: String,
                required: true
            },
            content: {
                type: String,
                required: true
            },
            resolve: {
                type: Function,
                default: () => {}
            },
            activator: {
                type: Boolean,
                default: false
            }
        },
        data: () => {
            return {
                dialog: false
            }
        },
        watch: {
            activator(val){
                this.dialog = val;
            }
        },
        methods: {
            agree(){
                this.resolve(true);
                this.dialog = false;
            },
            cancel(){
                this.resolve(false);
                this.dialog = false;
            }
        }
    }
</script>
