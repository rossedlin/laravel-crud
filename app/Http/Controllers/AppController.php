<?php

namespace App\Http\Controllers;

use App\Models\File;
use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Routing\Redirector;

class AppController extends Controller
{
    /**
     * @return Application|Factory|View|\Illuminate\Foundation\Application
     */
    public function index()
    {
        return view('app');
    }

    /**
     * @return JsonResponse
     */
    public function load(): JsonResponse
    {
        $response = [];
        foreach (File::all() as $file) {
            $response[] = [
                'id' => $file->id,
                'filename' => $file->filename,
            ];
        }

        return response()->json($response);
    }

    /**
     * @param Request $request
     * @return Application|\Illuminate\Foundation\Application|RedirectResponse|Redirector
     * @throws FileNotFoundException
     */
    public function create(Request $request)
    {
        $file = new File();
        $uploaded = $request->file('file');

        if ($uploaded instanceof UploadedFile) {
            $file->filename = $uploaded->getClientOriginalName();
            $file->mime_type = $uploaded->getClientMimeType();
            $file->file = $uploaded->get();
            $file->save();

            return response()->json(['success' => true]);
        }

        throw new \Exception('Failed');
    }

    /**
     * @param File $file
     * @return mixed
     */
    public function read(File $file)
    {
        return response($file->file)
            ->header('Cache-Control', 'no-cache private')
            ->header('Content-Description', 'File Transfer')
            ->header('Content-Type', $file->mime_type)
            ->header('Content-length', strlen($file->file))
            ->header('Content-Disposition', 'attachment; filename=' . $file->filename)
            ->header('Content-Transfer-Encoding', 'binary');
    }

    /**
     * @param Request $request
     * @param File $file
     * @return JsonResponse
     * @throws FileNotFoundException
     */
    public function update(Request $request, File $file)
    {
        $uploaded = $request->file('file');

        if ($file instanceof File && $uploaded instanceof UploadedFile) {
            $file->filename = $uploaded->getClientOriginalName();
            $file->mime_type = $uploaded->getClientMimeType();
            $file->file = $uploaded->get();
            $file->save();

            return response()->json(['success' => true]);
        }

        throw new \Exception('Failed');
    }

    /**
     * @param File $file
     * @return JsonResponse
     */
    public function destroy(File $file): JsonResponse
    {
        $file->delete();

        return response()->json(['success' => true]);
    }
}
