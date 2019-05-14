<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
        ></c-form>
        <v-btn
            @click="onSendForm"
            color="success"
        >
            <v-icon left>fas fa-save</v-icon>
            Update Password
        </v-btn>
    </v-flex>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';

    export default {
        name: 'AdminPasswordForm',
        computed: {
            ...mapGetters({
                violations: 'user/update/violations',
                loading: 'user/update/isLoading'
            })
        },
        data: () => {
            return {
                fields: [
                    { name: 'plainPassword', type: 'password', label: 'Masukkan password baru', required: true},
                    { name: 'plainPasswordConfirm', type: 'password', label: 'Masukkan ulang password baru'},
                ],
                values: {
                    plainPassword: null,
                    plainPasswordConfirm: null,
                },
                snackbarType: null
            }
        },
        methods: {
            ...mapActions({
                update: 'user/update/update',
                snackbarSuccess: 'siap/snackbarSuccess',
                snackbarError: 'siap/snackbarError',
            }),
            onSendForm(){
                const payload = {
                    plainPassword: this.values.plainPassword
                };
                this.update(payload)
                    .then( () => {
                        this.snackbarSuccess('Password baru berhasil disimpan');
                    })
                    .catch( () => {
                        this.snackbarError('Gagal merubah password!');
                    })
                ;
            }
        }
    }
</script>
