<template>
    <c-card
        title="Biodata"
    >
        <c-form
            :fields="fields"
            :values="values"
            :errors="violations"
            :initial-values="item"
            :handle-update-field="handleUpdate"
        >
        </c-form>
        <v-flex slot="actions">
            <v-btn
                @click="onSendForm"
                color="success"
                :loading="loading"
                small
            >
                <v-icon left v-text="$vuetify.icons.save"></v-icon>
                Simpan
            </v-btn>
        </v-flex>
    </c-card>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';

    export default {
        data: () => {
            return {
                fields: [
                    { name: 'nama', type: 'text', label: 'Nama Lengkap Pengguna', required: true},
                    { name: 'username', type: 'text', label: 'Username yang digunakan untuk login'},
                    { name: 'email', type: 'text', label: 'Email pengguna'},
                ],
                values: {}
            }
        },
        computed: {
            ...mapGetters({
                loading: 'user/update/isLoading',
                violations: 'user/update/violations',
                retrieved: 'user/update/retrieved',
                error: 'user/update/error'
            }),
            item(){
                return this.retrieved || this.values;
            }
        },
        methods: {
            ...mapActions({
                update: 'user/update/updateProfile'
            }),
            handleUpdate(field,value){
                this.retrieved[field] = value;
            },
            onSendForm(){
                this.$emit('update-profile');
            }
        }
    }
</script>
