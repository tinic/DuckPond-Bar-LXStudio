import java.util.List;
import java.lang.Math;
import java.util.Random;
import java.util.Iterator;
import java.util.Collections;

@LXCategory("Color")
public static class BarPattern extends LXPattern {
  double tm = 0.0;

  public enum Effect {
    Spring,
    Summer,
    Autum,
    Winter
  };

  public final EnumParameter<Effect> effect =
    new EnumParameter<Effect>("Effect", Effect.Spring)
    .setDescription("Which built-in Effect?");

  public BarPattern(LX lx) {
    super(lx);
    addParameter("effect", this.effect);
  }

  public void run(double deltaMs) {
    tm += deltaMs * (1.0 / 1000.0);
    for (LXFixture fixture : model.fixtures) {
       BarFixture barFixture = (BarFixture)fixture;
       List<LXPoint> points = barFixture.getPoints();
       for (int c = 0; c < points.size(); c++) {
          LXPoint p = points.get(c);
          LXFloat4 f = barFixture.calc(effect.getEnum(), c, tm, new LXFloat4(p.x, p.y, p.z, 1.0));
          colors[p.index] = LXColor.rgb((int)(f.x*255.0), (int)(f.y*255.0), (int)(f.z*255.0));
       } 
    }
  }  
}

@LXCategory("Color")
public static class RandomPattern extends LXPattern {

  Random rd = new Random(); // creating Random object

  public RandomPattern(LX lx) {
    super(lx);
  }

  public void run(double deltaMs) {
    for (LXPoint p : model.points) {
      colors[p.index] = LXColor.rgb((int)(rd.nextFloat()*255.0), (int)(rd.nextFloat()*255.0), (int)(rd.nextFloat()*255.0));
    } 
  }
}
