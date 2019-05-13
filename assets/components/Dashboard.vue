<template>
    <v-flex md12 fill-height>
        <v-toolbar color="cyan" dark>
            <v-toolbar-title centered>
                Hello World
            </v-toolbar-title>
        </v-toolbar>
        <v-card>
            <v-card-text>
                <Test></Test>
            </v-card-text>
        </v-card>
    </v-flex>
</template>

<script>
    import Test from '../plugins/theme/Test'
    export default {
        name: 'Dashboard',
        components: {
            Test
        }
    }
</script>
