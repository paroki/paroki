<template>
    <v-app id="inspire">
        <v-content>
            <v-container fluid fill-height>
                <v-layout align-center justify-center>
                    <v-flex xs12 sm8 md4>
                        <v-card class="elevation-12">
                            <v-toolbar dark color="primary">
                                <v-toolbar-title>Login form</v-toolbar-title>
                                <v-spacer></v-spacer>
                            </v-toolbar>
                            <v-card-text>
                                <v-alert
                                    v-model="hasError"
                                    type="error"
                                    dismissible
                                >
                                    {{ error }}
                                </v-alert>
                            </v-card-text>
                            <v-card-text>
                                <v-form>
                                    <v-text-field
                                        :prepend-icon="$vuetify.icons.user"
                                        name="username"
                                        label="Enter your username"
                                        v-model="username"
                                        type="text"></v-text-field>

                                    <v-text-field
                                        id="current-password"
                                        :prepend-icon="$vuetify.icons.password"
                                        name="currentPassword"
                                        label="Enter your current password"
                                        v-model="currentPassword"
                                        type="password"></v-text-field>
                                </v-form>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn
                                    @click="handleLogin"
                                    color="primary"
                                    :loading="!isLoading"
                                >Login</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-flex>
                </v-layout>
            </v-container>
        </v-content>
    </v-app>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';
    export default {
        data: () => ({
            drawer: null,
            username: null,
            currentPassword: null
        }),
        props: {
            source: {
                type: String,
                default: 'https://github.com/paroki/siap.git'
            }
        },
        computed: {
            ...mapGetters({
                error: 'siap/loginError'
            }),
            hasError(){
                return this.error ? true:false;
            }
        },
        created(){
            this.logout();
            this.reset();
        },
        beforeDestroy(){
            this.reset();
        },
        methods: {
            ...mapActions({
                login: 'siap/login',
                reset: 'siap/loginReset',
                isLoading: 'siap/isLoading',
                logout: 'siap/logout'
            }),
            handleLogin(){
                const payload = {
                    username: this.username,
                    password: this.currentPassword
                };
                this.login(payload)
                    .then(() => {
                        this.$router.push('/');
                    })
                ;
            }
        }
    }
</script>
