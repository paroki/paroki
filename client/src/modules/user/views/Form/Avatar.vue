<template>
    <c-card
        title="Foto"
    >
        <v-avatar size="128px" v-if="retrieved['foto'] && retrieved['foto'].filePath">
            <img :src="avatarUrl"/>
        </v-avatar>
        <c-upload-button
            name="foto"
            label="Upload Foto"
            @file-changed="handleFileChanged"
        ></c-upload-button>
    </c-card>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';
    import { ApiService } from '@/services';

    export default {
        computed: {
            ...mapGetters({
                retrieved: 'user/update/retrieved'
            }),
            avatarUrl(){
                return ApiService.generateFullUrl(this.retrieved.foto['contentUrl']);
            }
        },
        methods: {
            ...mapActions({
                uploadAvatar: 'user/update/uploadAvatar'
            }),
            handleFileChanged(file){
                this.uploadAvatar(file);
            }
        }
    }
</script>
