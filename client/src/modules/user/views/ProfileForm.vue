<template>
    <v-flex>
        <v-avatar size="128px" v-if="item['foto'] && item['foto'].filePath">
            <img :src="setAvatarUrl(item['foto']['contentUrl'])"/>
        </v-avatar>
        <upload-btn
            @file-update="upload"
            @click="$refs.button.clear()"
            title="Upload Foto"
            :loading="loading"
            noTitleUpdate
            small
        ></upload-btn>
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
    import UploadButton from 'vuetify-upload-button';
    import ApiService from '@/services/ApiService';
    import { mapActions, mapGetters } from 'vuex';

    export default {
        components: {
            'upload-btn': UploadButton
        },
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
                },
                avatar: null,
                title: 'Upload Foto'
            }
        },
        created(){
            if(this.type === 'create'){
                this.fields.push(this.passwordField);
                this.fields.push(this.passwordConfirmField);
            }
            this.setAvatarUrl();
        },
        computed: {
            ...mapGetters({
                loading: 'user/update/isLoading'
            }),
            // eslint-disable-next-line
            item (){
                return this.initialValues || this.values
            },
            violations(){
                return this.errors ? this.errors:{};
            }
        },
        methods: {
            ...mapActions({
                uploadAvatar: 'user/update/uploadAvatar'
            }),
            upload(file){
                this.uploadAvatar(file).then( () => {
                    this.title='Upload Foto';
                });
            },
            setAvatarUrl(path){
                return ApiService.generateFullUrl(path);
            }
        }
    }
</script>
