package com.jian.homedesigner;

import android.net.Uri;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;

import com.google.ar.core.Anchor;
import com.google.ar.sceneform.AnchorNode;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.rendering.ViewRenderable;
import com.google.ar.sceneform.ux.ArFragment;
import com.google.ar.sceneform.ux.TransformableNode;

public class MARActivity extends AppCompatActivity {
    private ArFragment arFragment;
    private FrameLayout arPage;
    private FrameLayout goodsPage;
    private Button switch_goods;
    private LinearLayout goods_chair;
    private LinearLayout goods_sofa;
    private LinearLayout goods_table;
    private LinearLayout goods_TV;
    private ImageButton returnButton;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mar);
        goodsPage = (FrameLayout)findViewById(R.id.marFragment_list);
        arPage = (FrameLayout)findViewById(R.id.marFragment);
        arFragment = (ArFragment)getSupportFragmentManager().findFragmentById(R.id.marFragment_ar);
        switch_goods = findViewById(R.id.marFragment_button);
        goods_chair = (LinearLayout)findViewById(R.id.mar_goodslist_chair);
        goods_table = (LinearLayout)findViewById(R.id.mar_goodslist_table);
        goods_sofa = (LinearLayout)findViewById(R.id.mar_goodslist_sofa);
        goods_TV = (LinearLayout)findViewById(R.id.mar_goodslist_TV);
        returnButton = (ImageButton) findViewById(R.id.mar_goodslist_return);
        //添加监听器，通过点击屏幕创建锚点
        arFragment.setOnTapArPlaneListener(((hitResult, plane, motionEvent) ->{

            Anchor anchor = hitResult.createAnchor();
            ModelRenderable.builder()
                           .setSource(this, Uri.parse(MainActivity.model+".sfb"))
                           .build()
                           .thenAccept(modelRenderable -> addModelToScene(anchor,modelRenderable))
                           .exceptionally(throwable -> {
                               AlertDialog.Builder builder = new AlertDialog.Builder(this);
                               builder.setMessage(throwable.getMessage())
                                      .show();
                               return null;
                           });
        }));
        switch_goods.setOnClickListener(v -> goodsPage.setVisibility(View.VISIBLE));
        goods_chair.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.model="chair";
                goodsPage.setVisibility(View.GONE);
            }
        });
        goods_table.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.model="table";
                goodsPage.setVisibility(View.GONE);
            }
        });
        goods_sofa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.model="sofa";
                goodsPage.setVisibility(View.GONE);
            }
        });
        goods_TV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MainActivity.model="tv";
                goodsPage.setVisibility(View.GONE);
            }
        });
        returnButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                goodsPage.setVisibility(View.GONE);
            }
        });
    }
    private void addModelToScene(Anchor anchor, ModelRenderable modelRenderable) {
        AnchorNode anchorNode = new AnchorNode(anchor);
        TransformableNode transformableNode = new TransformableNode(arFragment.getTransformationSystem());
        transformableNode.setParent(anchorNode);
        transformableNode.setRenderable(modelRenderable);
        arFragment.getArSceneView().getScene().addChild(anchorNode);
        transformableNode.select();
    }
}

