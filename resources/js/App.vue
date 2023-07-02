<script>
import {ref} from "vue";

export default {
    setup() {
        const file = ref();
        const files = ref([]);
        return {file, files}
    },
    mounted() {
        this.load();
    },
    methods: {
        upload(e) {
            this.file = e.target.files[0];
        },
        async load() {
            this.files = (await axios.get('/load')).data;
        },
        async create(e) {
            e.preventDefault();

            let data = new FormData();
            data.append('file', this.file);

            await axios.post('/', data, {headers: {'Content-Type': 'multipart/form-data'}});

            await this.load();
        },
        async update(e, id) {
            e.preventDefault();

            let data = new FormData();
            data.append('file', this.file);

            await axios.post('/' + id, data, {headers: {'Content-Type': 'multipart/form-data'}});

            await this.load();
        },

        async destroy(e, id) {
            e.preventDefault();

            await axios.delete('/' + id);

            await this.load();
        }
    },
}
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-12 mt-5 mb-5 text-center">
                <h1>Laravel CRUD (File Upload)</h1>
            </div>

            <div class="col-9">
                <input class="form-control form-control-lg"
                       name="file"
                       type="file"
                       v-on:change="upload"/>
            </div>
            <div class="col-3">
                <button type="submit" class="btn btn-primary mt-1" @click="create">Create</button>
            </div>

            <div class="col-12 mt-5">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Filename</th>
                        <th scope="col">Read</th>
                        <th scope="col">Update</th>
                        <th scope="col">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="file in this.files" :key="file.id">
                        <th scope="row">{{ file.id }}</th>
                        <td>{{ file.filename }}</td>
                        <td><a class="btn btn-primary" :href="'/' + file.id" target="_blank">Read</a></td>
                        <td><a class="btn btn-success" @click="update($event, file.id)">Update</a></td>
                        <td><a class="btn btn-danger" @click="destroy($event, file.id)">Delete</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>
