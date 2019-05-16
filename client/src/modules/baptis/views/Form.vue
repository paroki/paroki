<template>
    <v-flex>
        <c-form
            :fields="fields"
            :values="values"
            :initial-values="item"
            :errors="violations"
        ></c-form>
    </v-flex>
</template>

<script>
    export default {
        props: {
            handleSubmit: {
                type: Function,
                required: true
            },

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
                    { name: 'baptisId', type: 'text', label: 'baptisId' },
                    { name: 'buku', type: 'text', label: 'buku' },
                    { name: 'halaman', type: 'text', label: 'halaman' },
                    { name: 'nomor', type: 'text', label: 'nomor' },
                    { name: 'tempatBaptis', type: 'text', label: 'tempatBaptis' },
                    { name: 'tanggalBaptis', type: 'text', label: 'tanggalBaptis' },
                    { name: 'waliBaptis1', type: 'text', label: 'waliBaptis1' },
                    { name: 'waliBaptis2', type: 'text', label: 'waliBaptis2' },
                    { name: 'catatan', type: 'text', label: 'catatan' },
                    { name: 'updatedAt', type: 'text', label: 'updatedAt' },
                    { name: 'komuni', type: 'text', label: 'komuni' },
                    { name: 'krisma', type: 'text', label: 'krisma' },
                    { name: 'perkawinan', type: 'text', label: 'perkawinan' },
                    { name: 'diterima', type: 'text', label: 'diterima' },
                    { name: 'updatedBy', type: 'text', label: 'updatedBy' },
                    { name: 'paroki', type: 'text', label: 'paroki' },
                    { name: 'lingkungan', type: 'text', label: 'lingkungan' },
                    { name: 'agamaSebelumBaptis', type: 'text', label: 'agamaSebelumBaptis' },
                    { name: 'lanjutan', type: 'text', label: 'lanjutan' },
                    { name: 'kodeBaptis', type: 'text', label: 'kodeBaptis' },
                    { name: 'namaBaptis', type: 'text', label: 'namaBaptis' },
                    { name: 'dokumen', type: 'text', label: 'dokumen' },
                    { name: 'nama', type: 'text', label: 'nama' },
                    { name: 'jenisKelamin', type: 'text', label: 'jenisKelamin' },
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
