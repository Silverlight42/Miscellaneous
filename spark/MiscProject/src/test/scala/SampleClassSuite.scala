import capemo.{SampleClass, SparkSessionManager}
import org.scalatest.funsuite.AnyFunSuite

class SampleClassSuite extends AnyFunSuite {
  SparkSessionManager.localSpark = true

  test("Sample") {
    new SampleClass().main(Array.empty)
  }

}
