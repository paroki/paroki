<template>
    <v-flex md12 fill-height>
        <v-toolbar color="primary" class="lighten1" dark>
            <v-btn label="hello world" icon>
                <v-icon>fas fa-search</v-icon>
            </v-btn>
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
