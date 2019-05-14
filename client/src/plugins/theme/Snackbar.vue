<template>
    <v-snackbar
        v-model="snackbar"
        :color="color"
        class="lighten-5"
        top
        md12
    >
        {{ message }}
        <v-btn
            dark
            flat
            @click="snackbar = false"
        >
            Close
        </v-btn>
    </v-snackbar>
</template>

<script>
    import { mapGetters } from 'vuex';
    export default {
        name: 'c-snackbar',
        data: () => {
            return {
                snackbar: false,
                color: 'success',
                message: null,
            }
        },
        computed: {
            ...mapGetters({
                options: 'siap/snackbar'
            }),
        },
        watch: {
            options(options){
                this.color = options.type;
                this.message = options.message;
                this.snackbar = true;
            }
        }
    }
</script>
