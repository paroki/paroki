<template>
    <v-flex md12 fill-height>
        <c-card
            title="Component"
            text="Component tests"
            color="blue"
        >
            <template slot="actions">

            </template>
            <c-upload-button
                label="Upload File"
                @file-changed="handleUpload"
                color="success"
            />
        </c-card>
    </v-flex>
</template>

<script>
    export default {
        name: 'Dashboard',
        methods: {
            handleUpload(file){
                console.log(file);
            }
        }
    }
</script>