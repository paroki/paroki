<template>
    <div class="app flex-row align-items-center">
        <div class="container">
            <b-row class="justify-content-center">
                <b-col md="8">
                    <b-card-group>
                        <b-card no-body class="p-4">
                            <b-card-body>
                                <b-form>
                                    <h1>Login</h1>
                                    <p class="text-muted">Masuk ke dalam applikasi SIAP</p>
                                    <b-input-group class="mb-3">
                                        <b-input-group-prepend><b-input-group-text><i class="icon-user"></i></b-input-group-text></b-input-group-prepend>
                                        <b-form-input
                                            type="text"
                                            class="form-control"
                                            placeholder="Username"
                                            autocomplete="username email"
                                            v-model="username"
                                        />
                                    </b-input-group>
                                    <b-input-group class="mb-4">
                                        <b-input-group-prepend><b-input-group-text><i class="icon-lock"></i></b-input-group-text></b-input-group-prepend>
                                        <b-form-input
                                            v-model="password"
                                            type="password"
                                            class="form-control"
                                            placeholder="Password"
                                            autocomplete="current-password"
                                        />
                                    </b-input-group>
                                    <b-row>
                                        <b-col cols="6">
                                            <b-button v-on:click="handleLogin" type="button" variant="primary" class="px-4">Login</b-button>
                                        </b-col>
                                    </b-row>
                                </b-form>
                            </b-card-body>
                        </b-card>
                        <b-card no-body class="text-white bg-primary py-5 d-md-down-none" style="width:44%">
                            <b-card-body class="text-center">
                                <div>
                                    <h2>SIAP</h2>
                                    <p>Selamat datang di SIAP: <br/><b>Sistim Informasi Antar Paroki</b></p>
                                </div>
                            </b-card-body>
                        </b-card>
                    </b-card-group>
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';

    export default {
        name: 'Login',
        data(){
            return {
                username: null,
                password: null
            };
        },
        computed: {
            ...mapGetters({
                isLoading: 'siap/isLoading',
                token: 'siap/token'
            })
        },
        methods: {
            ...mapActions({
                login: 'siap/default'
            }),
            handleLogin(){
                let data = {
                    username: this.username,
                    password: this.password
                };
                this.login(data);
                //console.log(data);
                //console.log(this.$store.siap.login);
                //this.$store.siap.login(data);
                //console.log(this.$store);
            }
        }
    }
</script>
