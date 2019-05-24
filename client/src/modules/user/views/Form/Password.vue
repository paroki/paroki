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
                @click.stop="onSendForm"
                color="success"
                :loading="loading"
                small
            >
                <v-icon left v-text="$vuetify.icons.save"></v-icon>
                Update Password
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
                loading: 'user/update/isLoading',
                error: 'user/update/error'
            })
        },
        data: () => {
            return {
                fields: [
                    { id: 'current-password', name: 'currentPassword', type: 'password', label: 'Password anda saat ini', required: true},
                    { id: 'new-password', name: 'plainPassword', type: 'password', label: 'Masukkan password baru', required: true},
                    { id: 'new-password-confirm', name: 'plainPasswordConfirm', type: 'password', label: 'Masukkan ulang password baru'},
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
                this.$emit('update-password', this.values);
            }
        }
    }
</script>
