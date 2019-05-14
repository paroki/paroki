<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="item"
        >
        </c-form>
    </v-flex>
</template>
<script>
    export default {
        props: {
            errors: {
                type: [Array, Object],
                default: () => {}
            },
            initialValues: {
                type: [Array, Object],
                default: () => {}
            },
            type: {
                type: String,
                default: 'update'
            }
        },

        data: () => {
            return {
                fields: [
                    { name: 'nama', type: 'text', label: 'Nama Lengkap Pengguna', required: true},
                    { name: 'username', type: 'text', label: 'Username yang digunakan untuk login'},
                    { name: 'email', type: 'text', label: 'Email pengguna'},
                ],
                values: {},
                snackbar: {},
                passwordField: {
                    name: 'plainPassword',
                    type: 'password',
                    label: 'Masukkan password yang diinginkan',
                },
                passwordConfirmField: {
                    name: 'plainPasswordConfirm',
                    type: 'password',
                    label: 'Masukkan ulang password yang diinginkan',
                }
            }
        },
        created(){
            if(this.type === 'create'){
                this.fields.push(this.passwordField);
                this.fields.push(this.passwordConfirmField);
            }
        },
        computed: {
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            },
            violations(){
                return this.errors ? this.errors:{};
            }
        }
    }
</script>
