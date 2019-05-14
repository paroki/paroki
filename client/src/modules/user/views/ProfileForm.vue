<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="retrieved"
        >
        </c-form>
    </v-flex>
</template>
<script>
    export default {
        props: {
        },

        data: () => {
            return {
                fields: [
                    { name: 'nama', type: 'text', label: 'Nama Lengkap Pengguna', required: true},
                    { name: 'username', type: 'text', label: 'Username yang digunakan untuk login'},
                    { name: 'email', type: 'text', label: 'Email pengguna'},
                ],
                values: {},
                snackbar: {}
            }
        },
        computed: {
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            }
        },
        methods: {
            beforeDestroy () {
                this.reset()
            },
            isInvalid (key) {
                return Object.keys(this.violations).length > 0 && this.violations[key]
            },
            updateField (field, value) {
                this.updateRetrieved({ [field]: value })
            },
            del () {
                if (window.confirm('Are you sure you want to delete this user ?')) {
                    this.deleteItem(this.retrieved)
                }
            },
            reset () {
                this.updateReset()
                this.delReset()
                this.createReset()
            }
        }
    }
</script>
