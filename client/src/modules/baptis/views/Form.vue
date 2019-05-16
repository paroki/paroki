<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="item"
        ></c-form>
    </v-flex>
</template>

<script>
    export default {
        props: {
            handleUpdateField: {
                type: Function,
                required: true
            },

            values: {
                type: Object,
                required: true
            },

            errors: {
                type: Object,
                default: () => {}
            },

            initialValues: {
                type: Object,
                default: () => {}
            }
        },

        data: () => {
            return {
                fields: [
                    { name: 'buku', type: 'text', label: 'buku' },
                    { name: 'halaman', type: 'text', label: 'halaman' },
                    { name: 'nomor', type: 'text', label: 'nomor' },
                    { name: 'lanjutan', type: 'text', label: 'lanjutan' },
                    { name: 'namaBaptis', type: 'text', label: 'namaBaptis' },
                    { name: 'tempatBaptis', type: 'text', label: 'tempatBaptis' },
                    { name: 'tanggalBaptis', type: 'text', label: 'tanggalBaptis' },
                    { name: 'waliBaptis1', type: 'text', label: 'waliBaptis1' },
                    { name: 'waliBaptis2', type: 'text', label: 'waliBaptis2' },
                    { name: 'catatan', type: 'text', label: 'catatan' },
                    { name: 'nama', type: 'text', label: 'nama' },
                    { name: 'tempatLahir', type: 'text', label: 'tempatLahir' },
                    { name: 'tanggalLahir', type: 'text', label: 'tanggalLahir' },
                    { name: 'ayah', type: 'text', label: 'ayah' },
                    { name: 'ibu', type: 'text', label: 'ibu' },
                    { name: 'alamat', type: 'text', label: 'alamat' },
                ]
            }
        },

        computed: {
            // eslint-disable-next-line
            item () {
                return this.initialValues || this.values
            },

            violations () {
                return this.errors || {}
            }
        }
    }
</script>
