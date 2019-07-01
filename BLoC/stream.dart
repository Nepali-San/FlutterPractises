import 'dart:async';

//this is our cake and it can bake only Chocolate cake.
class Cake {
  toString() => 'Chocolate cake.';
}

//this takes the order of the cake of certain type.
class Order {
  String type;
  Order(this.type);
  toString() => 'your order is $type';
}

void main() {
  //creating our controller for controlling streams.
  final controller = StreamController();

  //it takes the type and sink , based on the type<event> we add values to the sink
  StreamTransformer baker =
      StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    print(cakeType);
    if (cakeType == 'chocolate') {
      //add object on sink, that triggers the transformed stream.
      sink.add(Cake());
      //can add more events like sink.add(Juice());
    } else {
      //add error on sink.
      sink.addError("I can't bake that type");
    }
  });

  //get the object of our order.
  final order = Order('chocolate');

  //add this order to sink that triggers our stream with order passed.
  controller.sink.add(order);

//stream is triggered by controller, sink added 'order' in this stream.
//map to extract a particular property of our order type to return a new stream event.
//if map function is not called , we pass entire 'order' to baker function.
  final streamWithType = controller.stream.map((order) => order.type);

//return a transformed stream.
  final transformedStream = streamWithType.transform(baker);
//listen to transformed stream.
  transformedStream.listen(
    //cake is added on sink by baker function which we get here.
    (cake) => print("Here's your $cake"),
    onError: (err) => print(err),
  );
}
