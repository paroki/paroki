<template>
  <div>
    <h1>Show {{ item && item['@id'] }}</h1>

    <div
      v-if="isLoading"
      class="alert alert-info"
      role="status">Loading...</div>
    <div
      v-if="error"
      class="alert alert-danger"
      role="alert">
      <span
        class="fa fa-exclamation-triangle"
        aria-hidden="true" /> {{ error }}
    </div>
    <div
      v-if="deleteError"
      class="alert alert-danger"
      role="alert">
      <span
        class="fa fa-exclamation-triangle"
        aria-hidden="true" /> {{ deleteError }}
    </div>
    <div
      v-if="item"
      class="table-responsive">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>Field</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>kodeBaptis</td>
            <td>{{ item['kodeBaptis'] }}</td>
          </tr>
          <tr>
            <td>buku</td>
            <td>{{ item['buku'] }}</td>
          </tr>
          <tr>
            <td>halaman</td>
            <td>{{ item['halaman'] }}</td>
          </tr>
          <tr>
            <td>nomor</td>
            <td>{{ item['nomor'] }}</td>
          </tr>
          <tr>
            <td>lanjutan</td>
            <td>{{ item['lanjutan'] }}</td>
          </tr>
          <tr>
            <td>namaBaptis</td>
            <td>{{ item['namaBaptis'] }}</td>
          </tr>
          <tr>
            <td>tempatBaptis</td>
            <td>{{ item['tempatBaptis'] }}</td>
          </tr>
          <tr>
            <td>tanggalBaptis</td>
            <td>{{ item['tanggalBaptis'] }}</td>
          </tr>
          <tr>
            <td>waliBaptis1</td>
            <td>{{ item['waliBaptis1'] }}</td>
          </tr>
          <tr>
            <td>waliBaptis2</td>
            <td>{{ item['waliBaptis2'] }}</td>
          </tr>
          <tr>
            <td>catatan</td>
            <td>{{ item['catatan'] }}</td>
          </tr>
          <tr>
            <td>nama</td>
            <td>{{ item['nama'] }}</td>
          </tr>
          <tr>
            <td>tempatLahir</td>
            <td>{{ item['tempatLahir'] }}</td>
          </tr>
          <tr>
            <td>tanggalLahir</td>
            <td>{{ item['tanggalLahir'] }}</td>
          </tr>
          <tr>
            <td>ayah</td>
            <td>{{ item['ayah'] }}</td>
          </tr>
          <tr>
            <td>ibu</td>
            <td>{{ item['ibu'] }}</td>
          </tr>
          <tr>
            <td>alamat</td>
            <td>{{ item['alamat'] }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <router-link
      v-if="item"
      :to="{ name: 'BaptisList' }"
      class="btn btn-default">Back to list</router-link>
    <button
      class="btn btn-danger"
      @click="deleteItem(item)">Delete</button>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  computed: mapGetters({
    deleteError: 'baptis/del/error',
    error: 'baptis/show/error',
    isLoading: 'baptis/show/isLoading',
    item: 'baptis/show/retrieved'
  }),

  beforeDestroy () {
    this.reset()
  },

  created () {
    this.retrieve(decodeURIComponent(this.$route.params.id))
  },

  methods: {
    ...mapActions({
      del: 'baptis/del/del',
      reset: 'baptis/show/reset',
      retrieve: 'baptis/show/retrieve'
    }),

    deleteItem (item) {
      if (window.confirm('Are you sure you want to delete this item?')) {
        this.del(item).then(() => this.$router.push({ name: 'BaptisList' }))
      }
    }
  }
}
</script>
