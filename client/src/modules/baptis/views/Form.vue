<template>
    <v-flex>
        <c-form
            v-bind="$attrs"
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="item"
            :handle-update-field="handleUpdateField"
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
                    { name: 'halaman', type: 'number', label: 'halaman'},
                    { name: 'nomor', type: 'number', label: 'nomor' },
                    { name: 'lanjutan', type: 'text', label: 'lanjutan' },
                    { name: 'nama', type: 'text', label: 'nama' },
                    {
                        name: 'jenisKelamin',
                        type: 'radio',
                        label: 'Jenis Kelamin',
                        options: [
                            { value: 1, label: 'Laki-Laki' },
                            { value: 2, label: 'Perempuan' },
                        ]
                    },
                    { name: 'tempatLahir', type: 'text', label: 'tempatLahir' },
                    { name: 'tanggalLahir', type: 'date', label: 'tanggalLahir' },
                    { name: 'ayah', type: 'text', label: 'ayah' },
                    { name: 'ibu', type: 'text', label: 'ibu' },
                    { name: 'alamat', type: 'text', label: 'alamat' },
                    { name: 'namaBaptis', type: 'text', label: 'namaBaptis' },
                    { name: 'tempatBaptis', type: 'text', label: 'tempatBaptis' },
                    { name: 'tanggalBaptis', type: 'date', label: 'tanggalBaptis' },
                    { name: 'waliBaptis1', type: 'text', label: 'waliBaptis1' },
                    { name: 'waliBaptis2', type: 'text', label: 'waliBaptis2' },
                    { name: 'catatan', type: 'text', label: 'catatan' },
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
