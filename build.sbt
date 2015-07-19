name := "pdfGenerator"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  "com.typesafe.slick" %% "slick" % "1.0.1",
  "com.typesafe.play" %% "play-slick" % "0.5.0.8",
  "net.databinder.dispatch" %% "dispatch-core" % "0.11.0",
  "commons-io" % "commons-io" % "2.3",
  "org.apache.xmlgraphics" % "fop" % "0.93"
)

play.Project.playScalaSettings