<template>
    <c-card
        title="Password"
    >
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
        ></c-form>
        <template slot="actions">
            <v-btn
                @click="onSendForm"
                color="success"
                small
            >
                <v-icon left v-text="$vuetify.icons.save"></v-icon>
                Simpan
            </v-btn>
        </template>
    </c-card>
</template>

<script>
    import { mapGetters, mapActions } from 'vuex';

    export default {
        computed: {
            ...mapGetters({
                violations: 'user/update/violations',
                loading: 'user/update/isLoading'
            })
        },
        data: () => {
            return {
                fields: [
                    { name: 'currentPassword', type: 'password', label: 'Password anda saat ini', required: true},
                    { name: 'plainPassword', type: 'password', label: 'Masukkan password baru', required: true},
                    { name: 'plainPasswordConfirm', type: 'password', label: 'Masukkan ulang password baru'},
                ],
                values: {
                    currentPassword: null,
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
